<script setup lang="ts">
import { z } from "zod"
import type { FormSubmitEvent } from "#ui/types"
import { userServices } from "../services"

const { signIn } = useAuth()
const router = useRouter()
const schema = z.object({
  email: z.string().email("Invalid email"),
  // password: z.string().min(8, "Must be at least 8 characters"),
})

type Schema = z.output<typeof schema>

const state = reactive({
  email: "",
  password: "",
})

const handleSubmit = async () => {
  try {
    await signIn("credentials", {
      redirect: true,
      email: state.email,
      password: state.password,
      callbackUrl: "/",
    })
    console.log("success")
  } catch (error) {
    console.log("error", error)
  }
}
</script>

<template>
  <div class="flex justify-center items-center">
    <UForm :schema="schema" :state="state" class="space-y-4" @submit="handleSubmit">
      <UFormGroup label="Email" name="email">
        <UInput v-model="state.email" />
      </UFormGroup>

      <UFormGroup label="Password" name="password">
        <UInput v-model="state.password" type="password" />
      </UFormGroup>
      <div class="flex items-center justify-between">
        <UButton type="submit"> Submit </UButton>
        <nuxtLink to="/" class="">retour accueil</nuxtLink>
      </div>
    </UForm>
  </div>
</template>
