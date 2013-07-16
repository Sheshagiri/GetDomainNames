use LWP::Simple;
use Data::Dumper;
use JSON qw( decode_json ); 
$content=get("http://reverseip.logontube.com/?url=$ARGV[0]&output=json");
#print($content);
#print("\n");
print("Domains for : ",$ARGV[0]," are : \n");  
my $decoded_json = decode_json($content);
#print Dumper $$decoded_json->{response}{domains};

foreach $s (@{$decoded_json->{response}{domains}})#yeah it could be done in another way but whatever
	{
		print($s,"\n");
		`nslookup $s`;
	}
