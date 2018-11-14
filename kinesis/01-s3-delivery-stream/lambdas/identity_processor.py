def handler(event, context):
	print(event)
	return {'records': event['records']}
