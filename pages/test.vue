<script setup lang="ts">
const { signIn, signOut, session, status, user, cookies, getProviders } = useAuth()
</script>

<template>
  <div>
    <div class="flex flex-col">
      <a href="/api/auth/signin" class="buttonPrimary">Native Link Sign in</a>
      <button @click="signIn()">JS Sign In</button>
      <button class="primary" @click="signOut()">Sign Out</button>
    </div>
    <div>
      <pre>status : {{ status }}</pre>
      <pre>session user : {{ session?.user }}</pre>
      <pre>cookie : {{ cookies }}</pre>
      <pre>user :  {{ session?.user?.firstname }}</pre>
      <pre>role : {{ session?.user?.role }}</pre>
    </div>
  </div>
</template>
