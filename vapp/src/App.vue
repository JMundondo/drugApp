<template>
  <div v-if="isDrizzleInitialized" id="app">
    <img alt="Vue logo" src="./assets/logo.jpeg" />

    <div class="section">
      <h2>Show the Accounts</h2>
      <drizzle-account units="Ether" :precision="2" />
    </div>
    <div class="section">
      <h2>register Manufacturer</h2>
      <RegisterManufacturer />
      <Toast/>
      
    </div>
 
    <div class="section">
      <h2>register New Drug</h2>
      <RegisterDrug />
      
    </div>
    <div class="section">
      <h2>Transfer Ownership</h2>
      <ChangeOwnership/>
      
    </div>
    <div>
    <h1>Drugs Transfers Through the supply chain </h1>
    
    </div>
    <div class="section">
      <h2>watch Array</h2>
      <ComplexStorage/>
      
    </div>
    <div class="section">
      <h2>watch Mapping</h2>
      <GetManufacturer/>
      
    </div>
  </div>

  <div v-else>Loading...</div>
</template>

<script>

import { mapGetters } from 'vuex' ;

import RegisterManufacturer from './RegisterManufacturer' ;

import  RegisterDrug from './RegisterDrug' ;

import   ChangeOwnership  from './ChangeOwnership' ;
import ComplexStorage from './ComplexStorage';

//import DrugArray from './DrugArray'
import GetManufacturer from './GetManufacturer'



import Toast from './Toast';



export default {
  name: 'app',
  computed: mapGetters('drizzle', ['isDrizzleInitialized']),
  components:{
   
    RegisterManufacturer,
    RegisterDrug,
    ChangeOwnership,
    Toast,
    ComplexStorage,
    GetManufacturer
   // DrugArray
    

  }

  
} 
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #ece4f180;
  margin-top: 60px;
  background-color: rgb(6, 57, 70);
}
img {
  width: 15%;
  height: auto;
}
</style>
