'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  API_HOST:'"https://www.chenzhuofan.top"'//这个是项目打包后访问的接口
})
