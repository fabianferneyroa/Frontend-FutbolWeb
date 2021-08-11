<template>
  <div>
      <div class="auth-nav" v-if="token">
          {{ user_data.nombreUsuario }} - <button @click="logOut">Cerrar sesión</button>
      </div>
    <Nuxt />
  </div>
</template>

<script>
export default {
    data: () => ({
        token: null,
        user_data: {},
    }),
    methods: {
        logOut() {
            localStorage.removeItem('jwt_token')
            this.$router.push('/login')
        }
    },
    beforeMount() {

        const token = localStorage.getItem('jwt_token')
        const user = localStorage.getItem('user_data')
        this.user_data = JSON.parse(user)
        this.$axios.defaults.headers.common['Authorization'] = token;
        this.token = token

        if (!token) {
            this.$router.push('/login')
        }
    }
}
</script>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.auth-nav {
    text-align: right;
}

.b-fix {
  border: 1px solid red;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

.container {
  width: 80%;
  margin: 0 auto;
}

.login-container,
.menu-container,
.goles-container,
.usuarios-container,
.partidos-container {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}

.login-box,
.container-goles,
.container-usuario,
.container-partido {
  display: flex;
  justify-content: center;
  align-items: center;

  width: 50%;
  height: 30%;
}

.form_login,
.goles-form,
.usuario-form,
.partido-form {
  padding: 20px;
  display: flex;
  justify-content: center;
  flex-direction: column;
}

label {
  margin: 4px 0px;
  font-size: 18px;
}

input {
  margin: 4px 0px;
  border: 1px solid gray;
  height: 25px;
  width: 300px;
}

button, a {
  display: inline-block;
  border: none;
  padding: 1rem 2rem;
  margin: 20px 10px;
  text-decoration: none;
  background: #00a2ff;
  color: #ffffff;
  font-family: sans-serif;
  font-size: 1rem;
  line-height: 1;
  cursor: pointer;
  text-align: center;
  transition: background 250ms ease-in-out, transform 150ms ease;
  -webkit-appearance: none;
  -moz-appearance: none;
}

.d-none {
  display: none;
}

button:hover {
  background: #014166;
}

.link {
  text-decoration: none;
  color: #014166;
}

a:visited {
  color: #014166;
}

.verde {
  background-color: green;
}
</style>