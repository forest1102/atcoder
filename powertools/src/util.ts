export const toCmdParam = (obj: { [key: string]: string }) =>
  obj
    ? Object.keys(obj).reduce((acc, key) => acc + ` --${key} "${obj[key]}"`, '')
    : ''
