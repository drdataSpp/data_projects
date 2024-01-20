with cte_segments as 
(
    select 
        Segment           as SEGMENT_NAME
    from {{ source('RAW_SuperStore_tbl', 'RAW_SuperStore')}}
    --adding group by clause to filter dups
    group by Segment
)

select * from cte_segments;