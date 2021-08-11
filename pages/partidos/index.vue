<template>
  <div class="#">
    <div class="#">
      <button @click="$router.push('/partidos/nuevo')">Agregar partido</button>
      <button @click="editMode = !editMode">{{ editMode ? 'Salir del' : 'Entrar al'}} modo de edición</button>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Usuario</th>
          <th>Equipo local</th>
          <th>Equipo visitante</th>
          <th>Goles local</th>
          <th>Goles visitante</th>
          <th>Fecha Partido</th>
          <th>Acciones</th>
        </tr>
      </thead>
      <tbody>
          <tr v-for="(partido, i) in partidos" :key="i">
              <td>{{ partido.idPartido }}</td>
              <td>{{ partido.idUsuario.nombreUsuario }}</td>
              <td>{{ partido.equipoLocal.nombreEquipo }}</td>
              <td>{{ partido.equipoVisitante.nombreEquipo }}</td>
              <template v-if="editMode">
                <td><input type="text" v-model="partido.golesEquipoLocal"></td>
                <td><input type="text" v-model="partido.golesEquipoVisitante"></td>
              </template>
              <template v-else>
                <td>{{ partido.golesEquipoLocal }}</td>
                <td>{{ partido.golesEquipoVisitante }}</td>
              </template>
              
              <td>{{ new Date(partido.fechaPartido).toLocaleDateString("es-CO") }}</td>
              <td>
                  <button @click="deletePartido(partido.idPartido)">X</button>
                  <button v-if="editMode" @click="save(partido)">Guardar</button>
                  </td>
          </tr>
      </tbody>
    </table>
    </div>
  </div>
</template>
<script>
export default {
    data: () => ({
        partidos: [],
        editMode: false,
    }),
    methods: {
        deletePartido(id) {
            this.$axios.delete('/Partido/' + id).then((response) => {
                this.getPartidos()
            })
        },
        save(partido) {
            this.editMode = false
            this.$axios.post('/Partido/update', partido).then((response) => {
                this.getPartidos()
            })
        },
        
        getPartidos() {
            const token = localStorage.getItem('jwt_token')
            const headers = { Authorization: token };
            this.$axios.get('/Partido/listar', headers, {withCredentials: true}).then((response) => {
                this.partidos = response.data
            })
        }
    },
    mounted() {
        this.getPartidos()
    }
}
</script>