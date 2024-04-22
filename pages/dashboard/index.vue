<script setup lang="ts">
definePageMeta({ middleware: "auth", auth: { guestRedirectTo: "/login" } })
</script>
<template>
  <h1>This is the index of the dashboard</h1>
</template>
