<script setup lang="ts">
definePageMeta({ middleware: "auth", auth: { guestRedirectTo: "/login" } })
</script>
<template>
  <h1>This is the forms view</h1>
</template>
