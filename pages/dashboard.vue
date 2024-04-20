<script setup lang="ts">
definePageMeta({ middleware: "auth", auth: { guestRedirectTo: "/login" } })
</script>
<template>
  <h1>This is the main dashboard page</h1>
</template>
