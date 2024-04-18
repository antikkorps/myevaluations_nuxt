// import GithubProvider from "@auth/core/providers/github"
import Credentials from "@auth/core/providers/credentials"
import type { AuthConfig } from "@auth/core/types"
import { NuxtAuthHandler } from "#auth"
import bcrypt from "bcrypt"

import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient()

// The #auth virtual import comes from this module. You can use it on the client
// and server side, however not every export is universal. For example do not
// use sign-in and sign-out on the server side.

const runtimeConfig = useRuntimeConfig()

// Refer to Auth.js docs for more details
export const authOptions: AuthConfig = {
  secret: runtimeConfig.authJs.secret,
  providers: [
    // GithubProvider({
    //   clientId: runtimeConfig.github.clientId,
    //   clientSecret: runtimeConfig.github.clientSecret,
    // }),
    Credentials({
      name: "credentials",
      credentials: {
        email: { label: "email", type: "email" },
        password: { label: "password", type: "password" },
      },
      authorize: async (credentials) => {
        if (typeof credentials.email !== "string") {
          throw new Error("Invalid email")
        }
        if (
          typeof credentials.email !== "string" ||
          typeof credentials.password !== "string"
        ) {
          throw new Error("Invalid credentials")
        }
        const user = await prisma.user.findUnique({
          where: {
            email: credentials.email,
          },
        })

        if (!user) {
          throw new Error("No user found")
        }

        const isValid = await bcrypt.compare(credentials.password, user.password)

        if (!isValid) {
          throw new Error("Invalid password")
        }
        return {
          id: user.id,
          email: user.email,
          firstName: user.firstname,
          lastName: user.lastname,
          avatar: user.avatar,
          role: user.role,
        }
      },
    }),
  ],
}

export default NuxtAuthHandler(authOptions, runtimeConfig)
// If you don't want to pass the full runtime config,
//  you can pass something like this: { public: { authJs: { baseUrl: "" } } }
