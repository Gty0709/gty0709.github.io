// @ts-check
import { defineConfig, envField } from "astro/config";
import sitemap from "@astrojs/sitemap";
import { typst } from "astro-typst";
import { loadEnv } from "vite";

// Please check `defineConfig/env` in astro.config.mjs for schema
const e = loadEnv(process.env.NODE_ENV || "", process.cwd(), "");
const { SITE, URL_BASE } = e;

const EnvStr = (optional = true) =>
  envField.string({ context: "client", access: "public", optional });
const MustEnvStr = (optional = false) => EnvStr(optional);

export default defineConfig({
  // Whether to prefetch links while hovering.
  // See: https://docs.astro.build/en/guides/prefetch/
  prefetch: {
    prefetchAll: true,
  },

  site: SITE,
  base: URL_BASE,

  env: {
    schema: {
      SITE: MustEnvStr(),
      URL_BASE: EnvStr(),

      SITE_TITLE: EnvStr(),
      SITE_INDEX_TITLE: EnvStr(),
      SITE_DESCRIPTION: EnvStr(),

      // # Please remove them if you don't like to use backend.
      // `;` separated list of backend addresses
      BACKEND_ADDR: EnvStr(),
      BAIDU_VERIFICATION_CODE: EnvStr(),
      SITE_OWNER: EnvStr(),
      SITE_SOURCE_URL: EnvStr(),
    },
  },

  integrations: [
    sitemap(),
    typst({
      // Always builds HTML files
      mode: {
        default: "html",
        detect: () => "html",
      },
      // 添加图片路径处理配置（保留原有配置）
      assets: {
        baseUrl: "/",
        contentDir: "content",
        processImages: true,
      },
      // 基于构建环境（GitHub Actions 或本地）重写 Typst 产出的 <img> 路径
      options: {
        cheerio: {
          postprocess: ($) => {
            const isGh = process.env.GITHUB_ACTIONS === "true" || process.env.TYLANT_GH_RENDER === "true";
            if (isGh) {
              const base = "https://raw.githubusercontent.com/Gty0709/gty0709.github.io/refs/heads/main/content/article/";
              $("img").each((_, el) => {
                const src = $(el).attr("src");
                if (!src) return;
                if (src.startsWith("/content/article/")) {
                  const rel = src.replace(/^\/content\/article\//, "");
                  $(el).attr("src", base + rel);
                }
              });
            }
            return $;
          },
        },
      },
    }),
  ],

  vite: {
    build: {
      assetsInlineLimit(filePath, content) {
        const KB = 1024;
        return content.length < (filePath.endsWith(".css") ? 100 * KB : 4 * KB);
      },
    },
    ssr: {
      external: ["@myriaddreamin/typst-ts-node-compiler"],
      noExternal: ["@fontsource-variable/inter"],
    },
  },
});
