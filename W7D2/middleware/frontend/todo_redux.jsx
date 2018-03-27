import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  // store.dispatch = addLoggingToDispatch(store);
  store = applyMiddleware(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

const addLoggingToDispatch = (store) => {
  const storeDispatch = store.dispatch;
  return (action) => {
    console.log("old state: ", store.getState());
    console.log("action: ", action);
    storeDispatch(action);
    console.log("new state: ", store.getState());
  };
};

const applyMiddleware = (store, ...middlewares) => {
  const dispatch = store.dispatch;
  middlewares.forEach(function(middleware) {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch });
};
