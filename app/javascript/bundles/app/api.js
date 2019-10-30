import axios from './axios';

export const fetchVerticals = async () => (
  await axios.get("/verticals")
)