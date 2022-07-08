import os
import regex
import mods

fn main() {
	println('reading ...')
	a := os.read_file('bannedip')?
	ips := a.split(' ')
	n := ips.len
	mut cty := []string{cap: n}
	print('processing ')
	for ip in ips {
		cmd := 'geoiplookup $ip'
		res := os.execute(cmd).output
		qry := r'.*, (.*)$'
		mut re := regex.regex_opt(qry)?
		re.match_string(res)
		mut c := re.get_group_by_id(res, 0)
		if c.len == 0 {
			c = 'Unknown'
		}
		c = c.replace('\n', '')
		cty << c
		print('.')
	}
	println('\nsorting ...')
	cty.sort()
	ua := mods.dedup(cty)
	mut i := 0
	for key, val in ua {
		println('${key:30}: $val')
		i += 1
		if i > 9 {
			break
		}
	}
	println('bye.')
}
