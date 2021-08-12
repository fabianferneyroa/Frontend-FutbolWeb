<template>
  <div id="partidos-container" class="partidos-container">
    <div class="container-partido">
      <form @submit.prevent="submit">
        <div class="partido-form">
          <label for="equipoLocal" class="label">Equipo Local</label>
          <input
            type="text"
            name="equipoLocal"
            id="equipoLocal"
            v-model="payload.equipoLocal"
          />
          <label for="equipoVisitante" class="label">Equipo Visitante</label>
          <input
            type="text"
            name="equipoVisitante"
            id="equipoVisitante"
            v-model="payload.equipoVisitante"
          />
          <label for="fechaPartido" class="label">Fecha Partido</label>
          <input
            type="text"
            name="fechaPartido"
            id="fechaPartido"
            v-model="payload.fechaPartido"
          />
          <button type="submit">Registrar Partido</button>
        </div>
      </form>
    </div>
  </div>
</template>
<script>
export default {
  data: () => ({
      payload: {}
  }),
  methods: {
    submit() {
      this.$axios.post('/Partido/save', this.payload, {
        headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    }
      }).then((response) => {
          console.log(response.data)
          this.$router.push('/partidos')
      })
    }
  }
}
</script>