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

export default {
    safeStringify,
};