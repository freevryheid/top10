import os
import json
import regex
import mods

struct Add {
	sshd []string
}

fn main() {
	u := os.execute('id -u').output.trim_space()
	if u.int() != 0 {
		println('This program must be run as root!')
		exit(1)
	}
	println("getting banned list ...")
	mut s := os.execute('fail2ban-client banned').output
	s = s.replace("'", '"')
	d := json.decode([]Add, s)?
	ips := d[0].sshd
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
