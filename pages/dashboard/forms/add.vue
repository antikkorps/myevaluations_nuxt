<script setup lang="ts">
definePageMeta({
  layout: "dashboard",
  middleware: "auth",
  auth: { guestRedirectTo: "/login" },
})
</script>
<template>
  <CreateForm />
</template>
