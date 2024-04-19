<script setup lang="ts">
const { user, cookies, session } = useAuth()
</script>
<template>
  <div class="flex justify-center items-center cursor-pointer">
    <nuxt-link to="/profile">
      <UAvatar
        size="sm"
        :src="session?.user?.avatar"
        alt="Avatar"
        class="mx-2 pt-3 justify-center items-center"
      />
    </nuxt-link>
  </div>
</template>
