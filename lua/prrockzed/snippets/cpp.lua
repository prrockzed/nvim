local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- snippets goes here
local new = s(
	{ trig = "new", snippetType = "autosnippet" },
	fmta(
		[[
      #include <<bits/stdc++.h>>
      #define ll long long
      #define li long int
      #define ld long double
      #define vi vector<<int>>
      #define vil vector<<ll>>
      #define PB(a) push_back(a)
      #define MP(a, b) make_pair(a, b)
      #define PR pair<<int, int>>
      #define F first
      #define S second
      #define loop(i, n) for (int i = 0; i << n; i++)
      #define loopr(i, a, n) for (int i = a; i >>= n; i--)
      #define loops(i, a, n, step) for (int i = a; i << n; i += step)
      #define looprs(i, a, n, step) for (int i = a; i >>= n; i -= step)

      using namespace std;

      void solve() {
        <>
      }

      int main() {
        ios::sync_with_stdio(0);
        cin.tie(0);
        cout.tie(0);

        int t = 1;
        cin >>>> t;
        while (t--) {
          solve();
          cout <<<< endl;
        }

        return 0;
      }
    ]],
		{
			i(1, "// You code here"),
		}
	),
	{ condition = line_begin }
)

local no = s(
	{ trig = "no", snippetType = "autosnippet" },
	fmta(
		[[
      #include <<bits/stdc++.h>>
      #define ll long long
      #define li long int
      #define ld long double
      #define vi vector<<int>>
      #define PB(a) push_back(a)
      #define MP(a, b) make_pair(a, b)
      #define PR pair<<int, int>>
      #define F first
      #define S second
      #define loop(i, n) for (int i = 0; i << n; i++)
      #define loops(i, a, n, step) for (int i = a; i << n; i += step)

      using namespace std;

      int main() {
        <>

        return 0;
      }
    ]],
		{
			i(1, "// You code here"),
		}
	),
	{ condition = line_begin }
)

local sim = s(
	{ trig = "sim", snippetType = "autosnippet" },
	fmta(
		[[
      #include <<bits/stdc++.h>>
      using namespace std;

      int main() {
        <>

        return 0;
      }
    ]],
		{
			i(1, "// You code here"),
		}
	),
	{ condition = line_begin }
)

-- adding snippets
ls.add_snippets("cpp", {
	new,
	no,
	sim,
})
