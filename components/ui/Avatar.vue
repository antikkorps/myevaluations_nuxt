<script setup lang="ts">
const { user, cookies, session } = useAuth()
const props = defineProps({
  size: {
    type: String,
    default: "md",
  },
})
</script>
<template>
  <div class="flex justify-center items-center cursor-pointer">
    <nuxt-link to="/profile">
      <UAvatar
        :size="props.size"
        :src="session?.user?.avatar"
        icon="i-heroicons-photo"
        :alt="session?.user?.firstname + ' ' + session?.user?.lastname"
        class="mx-2"
      />
    </nuxt-link>
  </div>
</template>
