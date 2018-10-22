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

export const uploadFile = data => {
  return axios.request({
    url: 'upload_qiniu',
    method: 'post',
    data: data
  })
}

export const sendMail = data => {
  return axios.request({
    url: 'send_mail',
    method: 'post',
    data: data
  })
}

export const addOrUpdateUser = data => {
  return axios.request({
    url: 'add_update_user',
    method: 'post',
    data: data
  })
}

export const activeEmail = data => {
  return axios.request({
    url: 'active_email',
    method: 'post',
    data: data
  })
}
/**
 * 检验原始密码是否正确
 * @Author mengxiaofei
 * @Date   2018-10-17T10:15:54+0800
 * @param  {Object}          { id, password }
 * @return {[type]}
 */
export const checkpassword = data => {
  return axios.request({
    url: 'check_password',
    method: 'post',
    data: data
  })
}

export const deleteUser = id => {
  return axios.request({
    url: 'delete_user',
    method: 'post',
    data: {
      id
    }
  })
}

export const addOrUpdateLink = data => {
  return axios.request({
    url: 'add_update_link',
    method: 'post',
    data: data
  })
}

export const addOrUpdateTag = data => {
  return axios.request({
    url: 'add_update_tag',
    method: 'post',
    data: data
  })
}

export const hideOrDeleteLink = data => {
  return axios.request({
    url: 'hide_delete_link',
    method: 'post',
    data: data
  })
}

export const addCategory = data => {
  return axios.request({
    url: 'add_category',
    method: 'post',
    data: data
  })
}

/**
 * 删除分类
 * @Author mengxiaofei
 * @Date   2018-10-19T15:46:51+0800
 * @param  {Array}ids要删除的id数组
 * @return {[type]}[description]
 */
export const deleteCategory = ids => {
  return axios.request({
    url: 'delete_category',
    method: 'post',
    data: ids
  })
}

export const addOrUpdateArticle = data => {
  return axios.request({
    url: 'add_update_article',
    method: 'post',
    data: data
  })
}
