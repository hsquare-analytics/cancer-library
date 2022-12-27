
export const makeCallBackOnPromise = (e, callback: () => void) => {
  e.promise = new Promise<void>((resolve) => {
    callback();
    resolve();
  });
}
