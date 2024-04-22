<script setup lang="ts">
definePageMeta({ middleware: "auth", auth: { guestRedirectTo: "/login" } })
</script>
<template>
  <NuxtPage />
</template>
