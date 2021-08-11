<template>
  <div id="goles-container" class="goles-container">
    <div class="container-goles">
      <form @submit.prevent="submit">
        <div class="goles-form">
          <label for="equipoLocal">/* equipo local */</label>
          <label for="golesEquipoLocal">Numero de goles Equipo Local</label>
          <input
            type="text"
            name="golesEquipoLocal"
            id="golesEquipoLocal"
            v-model="payload.golesEquipoLocal"
          />
          <label for="equipoVisitante">/* equipo visitante */</label>
          <label for="golesEquipoVisitante"
            >Numero de goles Equipo Visitante</label
          >
          <input
            type="text"
            name="golesEquipoVisitante"
            id="golesEquipoVisitante"
            v-model="payload.golesEquipoVisitante"
          />
          <button type="submit">Registrar Goles</button>
        </div>
      </form>
    </div>
  </div>
</template>