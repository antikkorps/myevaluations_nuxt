<script setup lang="ts">
const { signOut } = useAuth()
</script>

<template>
  <nuxt-link to="/">
    <UButton color="primary" @click="signOut()" variant="solid">
      <i class="i-heroicons-power w-6 h-6"></i> Se déconnecter</UButton
    >
  </nuxt-link>
</template>
