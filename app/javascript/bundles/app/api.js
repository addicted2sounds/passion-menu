import axios from './axios';

export const fetchVerticals = async () => (
  axios.get("/verticals")
)

export const fetchCategories = async (verticalId) => (
  axios.get(`/verticals/${verticalId}/categories`)
)