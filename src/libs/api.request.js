import HttpRequest from '@/libs/axios'
import config from '@/config'
const baseUrl = process.env.NODE_ENV === 'development' ? config.baseUrl.dev : config.baseUrl.pro
// const baseUrl = 'https://api.bfrontend.com/v1/blog/'
const axios = new HttpRequest(baseUrl)
export default axios
