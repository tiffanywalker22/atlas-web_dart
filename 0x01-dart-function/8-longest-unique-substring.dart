String longestUniqueSubstring(String str) {
  int start = 0;
  int maxLength = 0;
  String longestSubstring = '';
  Set<String> charSet = {};

  for (int end = 0; end < str.length; end++) {
    while (charSet.contains(str[end])) {
      charSet.remove(str[start]);
      start++;
    }

    charSet.add(str[end]);

    if (end - start + 1 > maxLength) {
      maxLength = end - start + 1;
      longestSubstring = str.substring(start, end + 1);
    }
  }

  return longestSubstring;
}
