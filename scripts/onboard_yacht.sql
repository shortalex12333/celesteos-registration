-- ============================================================
-- ONBOARD NEW YACHT
-- ============================================================
-- Run this in Supabase SQL Editor (master project) after
-- receiving payment. Edit the values below then execute.
--
-- After running:
--   1. Run build_dmg.py with the yacht_id
--   2. DMG uploads automatically to Storage
--   3. Buyer can download from download.celeste7.ai
-- ============================================================

INSERT INTO fleet_registry (
    yacht_id,           -- Unique ID (uppercase, no spaces, e.g. MY_FREEDOM)
    yacht_id_hash,      -- Auto-computed below, don't edit
    yacht_name,         -- Display name (e.g. M/Y Freedom)
    yacht_model,        -- Optional (e.g. Benetti 50m)
    buyer_name,         -- Company or person name
    buyer_email         -- Where 2FA codes will be sent
) VALUES (
    -- ⬇️ EDIT THESE VALUES ⬇️
    'MY_NEW_YACHT', -- this is the yacht_id name selected.
    encode(digest('MY_NEW_YACHT', 'sha256'), 'hex'),  -- auto-hash, just match yacht_id above
    'M/Y New Yacht', -- this is the yacht_name collumn
    'Sunseeker 76', -- this is the yacht_model collumn
    'Buyer Company Ltd', -- this is the buyer_name collumn
    'captain@theiryacht.com'-- this is the buyer_email collumn
    -- ⬆️ EDIT THESE VALUES ⬆️
);

-- Verify it was created:
SELECT yacht_id, yacht_name, buyer_email, active, created_at
FROM fleet_registry
WHERE yacht_id = 'MY_NEW_YACHT';
