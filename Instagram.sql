/* =========================================================
   INSTAGRAM ANALYSIS — FULL SQL SCRIPT (ALL 10 STEPS)
   Table: instagram
   Author: Dev Rijwani
   Purpose: SQL analysis for Instagram Power BI Dashboard
   ========================================================= */


/* =========================================================
   STEP 1 — VIEW FIRST FEW ROWS (understand dataset)
   ========================================================= */
SELECT * 
FROM instagram 
LIMIT 10;


/* =========================================================
   STEP 2 — BASIC KPIs (for Power BI Cards)
   These are the main numbers shown in Power BI dashboard.
   ========================================================= */
SELECT 
    SUM(likes) AS total_likes,
    SUM(comments) AS total_comments,
    SUM(shares) AS total_shares,
    SUM(impressions) AS total_impressions,
    SUM(reach) AS total_reach,
    SUM(engagement_total) AS total_engagement
FROM instagram;


/* =========================================================
   STEP 3 — MEDIA TYPE PERFORMANCE
   Which media type performs best? (Reel, Photo, Video)
   Used for bar charts and donut charts.
   ========================================================= */
SELECT 
    media_type,
    ROUND(AVG(CAST(engagement_rate AS NUMERIC)), 2) AS avg_eng_rate,
    SUM(impressions) AS total_impressions,
    SUM(engagement_total) AS total_engagement
FROM instagram
GROUP BY media_type
ORDER BY avg_eng_rate DESC;


/* =========================================================
   STEP 4 — TOTAL ENGAGEMENT BY MEDIA TYPE
   Shows which media type contributes the most overall.
   ========================================================= */
   
SELECT 
    media_type,
    SUM(engagement_total) AS total_engagement
FROM instagram
GROUP BY media_type
ORDER BY total_engagement DESC;


/* =========================================================
   STEP 5 — TOP 10 BEST PERFORMING POSTS
   Use for insights section or highlight cards.
   ========================================================= */
   
SELECT *
FROM instagram
ORDER BY engagement_total DESC
LIMIT 10;


/* =========================================================
   STEP 6 — HIGHEST IMPRESSIONS (Top 10)
   Useful for identifying viral posts.
   ========================================================= */
   
SELECT *
FROM instagram
ORDER BY impressions DESC
LIMIT 10;


/* =========================================================
   STEP 7 — CATEGORY ANALYSIS (if column exists)
   If you included content categories (Tech, Beauty, etc.)
   ========================================================= */
   
SELECT 
    media_type,
    ROUND(AVG(CAST(engagement_rate AS NUMERIC)), 2) AS avg_eng_rate,
    SUM(engagement_total) AS total_engagement
FROM instagram
GROUP BY media_type
ORDER BY avg_eng_rate DESC;


/* =========================================================
   STEP 8 — FOLLOWERS ANALYSIS
   Shows total followers gained from all posts.
   ========================================================= */
   
SELECT 
    SUM(followers) AS total_followers_gained
FROM instagram;


/* =========================================================
   STEP 9 — MEDIA TYPE VS FOLLOWERS GAINED
   Shows which content brings more followers.
   ========================================================= */
   
SELECT 
    media_type,
    SUM(followers) AS followers_gained
FROM instagram
GROUP BY media_type
ORDER BY followers_gained DESC;


/* =========================================================
   STEP 10 — SUMMARY TABLE (BEST FOR POWER BI)
   Pre-aggregated table includes all key metrics.
   Use this query directly inside Power BI visuals.
   ========================================================= */
SELECT
    media_type,
    SUM(impressions) AS total_impressions,
    SUM(engagement_total) AS total_engagement,
    ROUND(AVG(CAST(engagement_rate AS NUMERIC)), 2) AS avg_eng_rate,
    SUM(likes) AS total_likes,
    SUM(comments) AS total_comments,
    SUM(shares) AS total_shares,
    SUM(followers) AS total_followers_gained
FROM instagram
GROUP BY media_type
ORDER BY avg_eng_rate DESC;
