import request from '@/utils/request'

// 查询restaurant列表
export function listRestaurant(query) {
  return request({
    url: '/restaurant/restaurant/list',
    method: 'get',
    params: query
  })
}

// 查询restaurant详细
export function getRestaurant(restaurantId) {
  return request({
    url: '/restaurant/restaurant/' + restaurantId,
    method: 'get'
  })
}

// 新增restaurant
export function addRestaurant(data) {
  return request({
    url: '/restaurant/restaurant',
    method: 'post',
    data: data
  })
}

// 修改restaurant
export function updateRestaurant(data) {
  return request({
    url: '/restaurant/restaurant',
    method: 'put',
    data: data
  })
}

// 删除restaurant
export function delRestaurant(restaurantId) {
  return request({
    url: '/restaurant/restaurant/' + restaurantId,
    method: 'delete'
  })
}
