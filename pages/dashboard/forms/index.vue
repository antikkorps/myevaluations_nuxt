<script setup lang="ts">
definePageMeta({ middleware: "auth", auth: { guestRedirectTo: "/login" } })
</script>
<template>
  <div class="flex flex-col">
    <h1>This is the forms view</h1>

    <nuxt-link to="/dashboard/forms/add">
      <UButton color="primary" variant="solid">Ajouter</UButton>
    </nuxt-link>
  </div>
</template>
