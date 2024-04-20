<script setup lang="ts">
import { z } from "zod"
import type { FormSubmitEvent } from "#ui/types"
import { userServices } from "../services"

const router = useRouter()
const schema = z.object({
  email: z.string().email("Invalid email"),
  password: z.string().min(8, "Must be at least 8 characters"),
  verifyPass: z.string().refine((data) => data === state.password, {
    message: "Les mots de passe ne correspondenxt pas",
  }),
})

type Schema = z.output<typeof schema>

const state = reactive({
  email: "",
  password: "",
  verifyPass: "",
})

const handleSubmit = async () => {
  try {
    await userServices.register(state.email, state.password)
    console.log("success")
    router.push("/login")
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

      <UFormGroup label="Mot de passe" name="password">
        <UInput v-model="state.password" type="password" />
      </UFormGroup>

      <UFormGroup label="Confirmez le mot de passe" name="verifyPass">
        <UInput v-model="state.verifyPass" type="password" />
      </UFormGroup>

      <div class="flex items-center justify-between">
        <UButton type="submit"> S'inscrire </UButton>
        <nuxtLink to="/" class="">retour accueil</nuxtLink>
      </div>
    </UForm>
  </div>
</template>
