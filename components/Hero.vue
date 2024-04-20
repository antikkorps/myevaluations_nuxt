<script setup lang="ts">
const { session, signOut } = useAuth()
</script>
<template>
  <div class="w-full flex justify-center items-center h-[calc(100vh-80px)]">
    <div class="text-center">
      <div class="max-w-md">
        <h1 class="text-5xl font-bold">Bienvenue sur le site MyEvaluation</h1>
        <p class="py-6">
          Pour évaluer tout ce que vous souhaitez comme vous le souhaitez et le partager
          facilement.
        </p>
        <div v-if="!session" class="w-full flex justify-center">
          <UiLoginButton />

          <UButton color="primary" variant="link" class="mx-2">En Savoir plus</UButton>
        </div>
        <div v-else class="w-full flex justify-center">
          <NuxtLink to="/dashboard">
            <UButton color="primary" variant="ghost" class="mx-2"
              >Tableau de bord</UButton
            ></NuxtLink
          >
          <UiLogoutButton />
        </div>
      </div>
    </div>
  </div>
</template>
