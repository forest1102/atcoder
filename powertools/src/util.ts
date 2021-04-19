export const toCmdParam = (obj: { [key: string]: string }) =>
  obj
    ? Object.keys(obj).reduce(
        (acc, key) =>
          acc + (!!obj[key] ? ` --${key} "${obj[key]}"` : ` --${key}`),
        ''
      )
    : ''
