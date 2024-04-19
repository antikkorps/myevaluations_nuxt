import { resolve } from "node:path"

// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: ["radix-vue", "@nuxt/ui", "@hebilicious/authjs-nuxt"],
  // Optional default config
  //  authJs: {
  //    verifyClientOnEveryRequest: true,
  //    guestRedirectTo: "/", // where to redirect if the user is not authenticated
  //    authenticatedRedirectTo: "/", // where to redirect if the user is authenticated
  //    baseUrl: "" // should be something like https://www.my-app.com
  //  },
  alias: {
    cookie: resolve(__dirname, "node_modules/cookie"),
  },
  runtimeConfig: {
    authJs: {
      secret: process.env.NUXT_NEXTAUTH_SECRET, // You can generate one with `openssl rand -base64 32`
    },
    // github: {
    //   clientId: process.env.NUXT_GITHUB_CLIENT_ID,
    //   clientSecret: process.env.NUXT_GITHUB_CLIENT_SECRET,
    // },
    public: {
      authJs: {
        baseUrl: process.env.NUXT_NEXTAUTH_URL, // The URL of your deployed app (used for origin Check in production)
        verifyClientOnEveryRequest: true, // whether to hit the /auth/session endpoint on every client request
        authenticatedRedirectTo: "/",
      },
      baseUrl: process.env.NUXT_BASE_URL,
    },
  },
})
