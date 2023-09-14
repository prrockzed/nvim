local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- snippets goes here
local compro = s("compro", {
	t({ "#include <bits/stdc++.h>", "" }),
	t({ "#define ll long long", "" }),
	t({ "#define li long int", "" }),
	t({ "#define ld long double", "" }),
	t({ "#define vi vector<int>", "" }),
	t({ "#define PB(a) push_back(a)", "" }),
	t({ "#define MP(a, b) make_pair(a, b)", "" }),
	t({ "#define PR pair<int, int>", "" }),
	t({ "#define F first", "" }),
	t({ "#define S second", "" }),
	t({ "#define loop(i, n) for (int i = 0; i < n; i++)", "" }),
	t({ "#define loopr(i, a, n) for (int i = a; i >= n; i--)", "" }),
	t({ "#define loops(i, a, n, step) for (int i = a; i < n; i += step)", "" }),
	t({ "#define looprs(i, a, n, step) for (int i = a; i >= n; i -= step)", "", "" }),
	t({ "using namespace std;", "", "" }),
	t({ "void solve() {", "  " }),
	i(1, "// Your Code Here"),
	t({ "", "}", "", "" }),
	t({ "int main() {", "" }),
	t({ "  ios::sync_with_stdio(0);", "" }),
	t({ "  cin.tie(0);", "" }),
	t({ "  cout.tie(0);", "", "" }),
	t({ "  int t = 1;", "" }),
	t({ "  cin >> t;", "" }),
	t({ "  while (t--) {", "" }),
	t({ "    solve();", "" }),
	t({ "  }", "", "" }),
	t({ "  return 0;", "" }),
	t("}"),
})

local nocompro = s("nocompro", {
	t({ "#include <bits/stdc++.h>", "" }),
	t({ "#define ll long long", "" }),
	t({ "#define li long int", "" }),
	t({ "#define ld long double", "" }),
	t({ "#define vi vector<int>", "" }),
	t({ "#define PB(a) push_back(a)", "" }),
	t({ "#define MP(a, b) make_pair(a, b)", "" }),
	t({ "#define PR pair<int, int>", "" }),
	t({ "#define F first", "" }),
	t({ "#define S second", "" }),
	t({ "#define loop(i, n) for (int i = 0; i < n; i++)", "" }),
	t({ "#define loops(i, a, n, step) for (int i = a; i < n; i += step)", "" }),
	t({ "using namespace std;", "", "" }),
	t({ "int main() {", "", "  " }),
	i(1, "// Your Code Here"),
	t({ "", "", "  return 0;", "" }),
	t("}"),
})

local simple = s("simple", {
	t({ "#include <bits/stdc++.h>", "" }),
	t({ "using namespace std;", "", "" }),
	t({ "int main() {", "", "  " }),
	i(1, "// Your Code Here"),
	t({ "", "", "  return 0;", "" }),
	t("}"),
})

-- adding snippets
ls.add_snippets("cpp", {
  compro,
  nocompro,
  simple,
})
