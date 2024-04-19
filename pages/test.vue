<script setup lang="ts">
const { signIn, signOut, session, status, user, cookies, getProviders } = useAuth()
</script>

<template>
  <div class="flex flex-col justify-center items-center w-full sm:w-1/2">
    <div class="flex flex-col">
      <a href="/api/auth/signin" class="buttonPrimary">Native Link Sign in</a>
      <button @click="signIn()">JS Sign In</button>
      <button class="primary" @click="signOut()">Sign Out</button>
    </div>
    <div class="w-1/2">
      <div>status : {{ status }}</div>
      <div>user : {{ session?.user?.firstname }}</div>
      <div>role : {{ session?.user?.role }}</div>
    </div>
  </div>
</template>
