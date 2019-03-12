compress(){
	local zip_name="$1$echo$(date +"%Y-%m-%d-%T").tar.gz"

	tar -czvf $zip_name $1

}

compress $1
