<template>
  <div id="login-container" class="login-container">
    <div class="login-box">
      <form @submit.prevent="submit">
        <div class="form_login">
          <label for="user_login">Usuario</label>
          <input type="text" name="user_login" id="user_login" v-model="credenciales.usuario" />
          <label for="password_login">Contraseña</label>
          <input type="password" name="password_login" id="password_login" v-model="credenciales.contraseña" />
          <button type="submit">Acceder</button>
          <nuxt-link class="test" to="/registro">Registrar usuarios</nuxt-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
    name: 'Login',
    data: () => ({
        credenciales: {
            usuario: null,
            contraseña: null
        }
    }),
    layout: 'auth',
    methods: {
        submit() {
            console.log('hola')
            this.$axios.post('/Usuario/login', this.credenciales).then((response) => {
                console.log('resp')
                console.log(response.data)
                localStorage.setItem('jwt_token', response.data.token)
                localStorage.setItem('user_data', JSON.stringify({
                    nombreUsuario: response.data.nombreUsuario
                }))
                this.$router.push('/')
            }).catch((error) => {
                console.error(error)
            })

        }
    }
}
</script>

<style scoped>

</style>