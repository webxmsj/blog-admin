import axios from '@/libs/api.request'

export const queryall = tablename => {
  return axios.request({
    url: 'query_all',
    params: {
      tablename: tablename
    },
    method: 'get'
  })
}

export const getDisplayStructure = (tablename) => {
  return axios.request({
    url: 'get_display_structure',
    params: {
      tablename: tablename
    },
    method: 'get'
  })
}

export const getCategorys = () => {
  return axios.request({
    url: 'get_categorys',
    method: 'get'
  })
}

export const getOriginalCategorys = () => {
  return axios.request({
    url: 'get_original_categorys',
    method: 'get'
  })
}

export const updateSetting = data => {
  return axios.request({
    url: 'update_setting',
    method: 'post',
    data: data
  })
}

export const getSettingByType = type => {
  return axios.request({
    url: 'get_setting_by_type',
    method: 'post',
    data: {
      type: type
    }
  })
}
