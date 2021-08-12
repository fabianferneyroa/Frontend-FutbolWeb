<template>
  <div id="usuarios-container" class="usuarios-container">
    <div class="container-usuario">
      <form @submit.prevent="submit">
        <div class="usuario-form">
          <label for="nombreUsuario" class="label">Nombre</label>
          <input
            type="text"
            name="nombreUsuario"
            id="nombreUsuario"
            v-model="payload.nombreUsuario"
          />
          <label for="correoUsuario" class="label">Correo Electronico</label>
          <input
            type="text"
            name="correoUsuario"
            id="correoUsuario"
            v-model="payload.correoUsuario"
          />
          <label for="username" class="label"> Usuario</label>
          <input
            type="text"
            name="username"
            id="username"
            v-model="payload.usuario"
          />
          <label for="passwordU" class="label">Contraseña</label>
          <input
            type="password"
            name="passwordU"
            id="passwordU"
            v-model="payload.contraseña"
          />
          <button type="submit">Registrar Usuario</button>
        </div>
      </form>
    </div>
  </div>
</template>
<script>
export default {
   layout: 'auth',
  data: () => ({
    payload: {},
  }),
  methods: {
    submit() {
      console.log("hola");
      this.$axios
        .post("/Usuario/auth/register", this.payload)
        .then((response) => {
          this.$router.push("/login");
        })
        .catch(() => {
          alert("Error al registrase");
        });
    },
  },
};
</script>