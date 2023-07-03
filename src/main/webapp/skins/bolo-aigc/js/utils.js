function safeStringify(obj) {
    const seen = new WeakSet();
    return JSON.stringify(obj, function(key, value) {
      if (typeof value === "object" && value !== null) {
        if (seen.has(value)) {
          return;
        }
        seen.add(value);
      }
      return value;
    });
}
function moveListItemIntoList(array, targetArray, item) {
  const index = array.findIndex((ele) => {
    ele.type = item.type;
  });
  const ix = array.splice(index, 1);
  targetArray.push(...ix);
}
export default {
    safeStringify,
    moveListItemIntoList,
};