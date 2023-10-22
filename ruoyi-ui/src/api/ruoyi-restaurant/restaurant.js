import request from '@/utils/request'

// 查询餐厅信息列表
export function listRestaurant(query) {
  return request({
    url: '/ruoyi-restaurant/restaurant/list',
    method: 'get',
    params: query
  })
}

// 查询餐厅信息详细
export function getRestaurant(restaurantId) {
  return request({
    url: '/ruoyi-restaurant/restaurant/' + restaurantId,
    method: 'get'
  })
}

// 新增餐厅信息
export function addRestaurant(data) {
  return request({
    url: '/ruoyi-restaurant/restaurant',
    method: 'post',
    data: data
  })
}

// 修改餐厅信息
export function updateRestaurant(data) {
  return request({
    url: '/ruoyi-restaurant/restaurant',
    method: 'put',
    data: data
  })
}

// 删除餐厅信息
export function delRestaurant(restaurantId) {
  return request({
    url: '/ruoyi-restaurant/restaurant/' + restaurantId,
    method: 'delete'
  })
}
