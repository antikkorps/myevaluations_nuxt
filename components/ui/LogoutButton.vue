<script setup lang="ts">
const { signOut } = useAuth()
</script>

<template>
  <nuxt-link to="/login">
    <UButton color="primary" @click="signOut()" variant="solid">Se déconnecter</UButton>
  </nuxt-link>
</template>
