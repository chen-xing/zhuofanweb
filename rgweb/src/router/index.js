import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import ImageTool from '@/components/ImageTool'
import ItNews from '@/components/ItNews'
import Home from '@/components/Home'
import Index from '@/components/Index'
import Json from '@/components/Json'
Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/HelloWorld',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/ImageTool',
      name: 'ImageTool',
      component: ImageTool
    },
    {
      path: '/ItNews',
      name: 'ItNews',
      component: ItNews
    },
    {
      path: '/index',
      name: 'Index',
      component: Index
    },
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/json',
      name: 'Json',
      component: Json
    }
  ]
})
