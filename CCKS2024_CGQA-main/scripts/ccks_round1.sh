cd C:\\Users\\Deaf\\Desktop\\课\\大三下\\综合课程设计3\\CCKS2024_CGQA-main\\CCKS2024_CGQA-main
OUTPUTPATH=output/ccks_round1
mkdir -p $OUTPUTPATH
GPU=0

CUDA_VISIBLE_DEVICES=$GPU python CGdata_for_ccks.py \
--key api_key.txt --num_process 1 \
--openai_url https://free.gpt.ge \
--folder_path dataset/CCKS_round1/kg\(utf8\).txt \
--data_path dataset/CCKS_round1/test_qa.json \
--prompt_path structllm/prompt_/ccks_round1.json \
--SC_Num 5 \
--model gpt-3.5-turbo-0125 \
--output_detail_path $OUTPUTPATH/output_detail \
--output_result_path $OUTPUTPATH/output_result \
--debug 0 \
--retriever_align text-embedding-ada-002

cat $OUTPUTPATH/output_detail* > $OUTPUTPATH/all_detail.txt
cat $OUTPUTPATH/output_result* > $OUTPUTPATH/all_result.txt

python Get_final_result.py \
--ori_path $OUTPUTPATH/all_result.txt \
--output_path $OUTPUTPATH/opduiduidui_result.txt
read -p "Press any key to continue..."