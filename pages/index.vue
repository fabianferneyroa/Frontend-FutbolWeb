<template>
  <div>
    <div class="menu-container">
      <button @click="$router.push('/partidos/nuevo')">Agregar partido</button>
      <nuxt-link class="verde" to="/partidos">Ver Partidos</nuxt-link>
    </div>
  </div>
</template>

<script>
export default {}
</script>
