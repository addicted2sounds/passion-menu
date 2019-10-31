import axios from 'axios';
import ls from 'local-storage';

const instance = axios.create({
  baseURL: "/api",
  timeout: 20000,
  headers: {
    "Content-Type": "application/json"
  }
});

instance.interceptors.response.use(
  response => response,
  error => {
    if (error.response.status === 401) {
      ls.remove('token');
    }
    return Promise.reject(error);
  }
)

export const setToken = token => {
  instance.defaults.headers.common['Authorization'] = `Bearer ${token}`;
  ls.set('token', token);
};


export default instance;