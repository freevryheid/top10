module mods

struct Counts {
	cty string
	cnt int
}

// return map of uniques and counts
// input array must be sorted
pub fn dedup(a []string) map[string]int {
	m := a.len
	mut res1 := []string{cap: m}
	mut res2 := []int{cap: m}
	mut prev1 := a[0]
	mut prev2 := 0
	res1 << prev1
	for i in 1 .. m {
		if a[i] != prev1 {
			prev1 = a[i]
			res1 << prev1
			res2 << i - prev2
			prev2 = i
		}
	}
	res2 << m - prev2

	n := res1.len
	mut counts := []Counts{cap: n}
	for i in 0 .. n {
		count := Counts{res1[i], res2[i]}
		counts << count
	}
	counts.sort(a.cnt > b.cnt)

	mut ua := map[string]int{}
	// n := res1.len
	for i in 0 .. n {
		ua[counts[i].cty] = counts[i].cnt
	}
	return ua
}
